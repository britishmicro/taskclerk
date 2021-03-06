//----------------------------------------------------------------------
//  Copyright (c) BritishMicro
//
//  Date  : 20th of Feb 2006
//	Author: John Powell (john.powell@britishmicro.com)
//----------------------------------------------------------------------

using System;
using System.Collections.ObjectModel;

namespace BritishMicro.TaskClerk
{
    /// <summary>
    /// TaskDescription Event Args are passed around by effents that require
    /// TaskDescription information to available.
    /// </summary>
    public class TaskDescriptionsEventArgs : EventArgs
    {
        private readonly Collection<TaskDescription> _items;
        private bool _cancel;

        /// <summary>
        /// Initializes a new instance of the <see cref="TaskDescriptionEventArgs"/> class.
        /// </summary>
        private TaskDescriptionsEventArgs()
        {
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="TaskDescriptionEventArgs"/> class.
        /// </summary>
        /// <param name="items">The items.</param>
        public TaskDescriptionsEventArgs(Collection<TaskDescription> items)
        {
            _items = items ?? throw new ArgumentNullException("items");
        }

        /// <summary>
        /// Gets the task descriptions.
        /// </summary>
        /// <value>The task description.</value>
        public Collection<TaskDescription> TaskDescriptions
        {
            get { return _items; }
        }

        /// <summary>
        /// Gets or sets a value indicating whether this <see cref="TaskDescriptionEventArgs"/> is cancel.
        /// </summary>
        /// <value><c>true</c> if cancel; otherwise, <c>false</c>.</value>
        public bool Cancel
        {
            get { return _cancel; }
            set { _cancel = value; }
        }
    }
}