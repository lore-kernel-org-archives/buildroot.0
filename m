From: Muhammed ER <er.muhammed@gmail.com>
Date: Wed, 24 Mar 2010 13:43:02 +0200
Subject: [Buildroot] Qt Phonon Sound problem
Message-ID: <f70863321003240443n22a999a2k7a7b5ae60103e619@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I make a simple example Phonon sound program. But there is error.

---------------
music = Phonon::createPlayer(Phonon::MusicCategory,
Phonon::MediaSource("/test/file.mp3"));
music->play();
----------------

When I clicked, nothing happens, but on console output is:

-----------------------------------------------------------------------------------------------------------------
./phonon_play_wav: can't resolve symbol 'theora_control'
Phonon::GStreamer::Backend: Failed to initialize GStreamer

(<unknown>:635): GStreamer-CRITICAL **: gst_object_ref: assertion `object !=
NULL' failed

(<unknown>:635): GStreamer-CRITICAL **: gst_object_sink: assertion
`GST_IS_OBJECT (object)' failed

(<unknown>:635): GLib-GObject-CRITICAL **: g_object_set: assertion
`G_IS_OBJECT (object)' failed

(<unknown>:635): GStreamer-CRITICAL **: gst_object_ref: assertion `object !=
NULL' failed

(<unknown>:635): GStreamer-CRITICAL **: gst_object_sink: assertion
`GST_IS_OBJECT (object)' failed

(<unknown>:635): GStreamer-CRITICAL **: gst_object_ref: assertion `object !=
NULL' failed

(<unknown>:635): GStreamer-CRITICAL **: gst_object_sink: assertion
`GST_IS_OBJECT (object)' failed

(<unknown>:635): GLib-GObject-CRITICAL **: g_object_set: assertion
`G_IS_OBJECT (object)' failed

(<unknown>:635): GStreamer-CRITICAL **: gst_object_ref: assertion `object !=
NULL' failed

(<unknown>:635): GStreamer-CRITICAL **: gst_object_sink: assertion
`GST_IS_OBJECT (object)' failed

(<unknown>:635): GStreamer-CRITICAL **: gst_element_set_state: assertion
`GST_IS_ELEMENT (element)' failed
WARNING: Phonon::createPath: Cannot connect  Phonon::MediaObject ( no
objectName ) to  Phonon::AudioOutput ( no objectName ).
-----------------------------------------------------------------------------------------------------------------

What is the problem? I can not solve it.

Regards,
Muhammed ER.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100324/1342714e/attachment.htm>
