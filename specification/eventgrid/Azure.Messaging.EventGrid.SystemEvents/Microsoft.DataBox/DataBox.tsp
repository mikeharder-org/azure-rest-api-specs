import "@typespec/versioning";
import "./DataBoxExample.tsp";
using TypeSpec.Versioning;
/** EG DataBox Data Model */
namespace Microsoft.EventGrid.SystemEvents {
  /** Schema of the Data property of an EventGridEvent for a Microsoft.DataBox.CopyStarted event. */
  @example(MicrosoftDataBoxCopyStartedExample)
  model DataBoxCopyStartedEventData {
    ...DataBoxBase;
  }

  /** Schema of the Data property of an EventGridEvent for a Microsoft.DataBox.CopyCompleted event. */
  @example(MicrosoftDataBoxCopyCompletedExample)
  model DataBoxCopyCompletedEventData {
    ...DataBoxBase;
  }

  /** Schema of the Data property of an EventGridEvent for a Microsoft.DataBox.OrderCompleted event. */
  @example(MicrosoftDataBoxOrderCompletedExample)
  model DataBoxOrderCompletedEventData {
    ...DataBoxBase;
  }

  alias DataBoxBase = {
    /** Serial Number of the device associated with the event. The list is comma separated if more than one serial number is associated. */
    serialNumber: string;

    /** Name of the current Stage */
    @madeRequired(ServiceApiVersions.v2024_01_01)
    stageName: DataBoxStageName;

    /** The time at which the stage happened. */
    @madeRequired(ServiceApiVersions.v2024_01_01)
    stageTime: utcDateTime;
  };

  /** Schema of DataBox Stage Name enumeration. */
  union DataBoxStageName {
    /** Copy has started */
    "CopyStarted",

    /** Copy has completed */
    "CopyCompleted",

    /** Order has been completed */
    "OrderCompleted",

    string,
  }
}
