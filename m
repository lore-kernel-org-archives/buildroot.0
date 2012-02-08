From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 9 Feb 2012 00:32:42 +0100
Subject: [Buildroot] [RFC] progress indicator
Message-ID: <CAGm1_kt5qPOB2fpWNRREejgp5jMhsM+o0Dq5Po3LHMpySecEjw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

What about making a progress indicator, so that user always knows how
many packages left to be built? Like Android (AOSP) does during repo
sync:

Fetching projects:  53% (127/238)  Receiving objects:  22% (290/1289), 195.95 Ki
Fetching projects:  54% (129/238)  Receiving objects:  28% (361/1289), 195.95 Ki
Fetching projects:  55% (131/238)  Receiving objects:  47% (606/1289), 643.81 Ki

Yegor
