From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 25 Feb 2014 18:08:54 +0100
Subject: [Buildroot] Make DTS file selection consistent.
Message-ID: <4063D5CA002D47408C461871BC2AF2DD@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


 Hi

I noticed that when specifying a custom dts file that the .dts file
extention must be included, but when an in tree dts is selected
only the basename is required.

Maybe this should be made consistent so no .dts file needs te be added when using a custom dts file.


Sagaert Johan
