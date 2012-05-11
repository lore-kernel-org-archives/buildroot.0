From: Simon Dawson <spdawson@gmail.com>
Date: Fri, 11 May 2012 14:27:53 +0100
Subject: [Buildroot] [PATCH] gpsd: Replace the deprecated finite
 function with the isfinite macro
In-Reply-To: <1336732472-13197-1-git-send-email-markos.chandras@imgtec.com>
References: <1336732472-13197-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <CAHt8ZCPkmz+w02RLo38xxFoGOxS2wv+Lx1OPvXGbo15whRTZZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I submitted an nearly identical patch back in April:

  http://lists.busybox.net/pipermail/buildroot/2012-April/052597.html

At the time, it was noted that the finite calls are not present in
newer gpsd releases, and I subsequently submitted a patch to bump the
gpsd package from version 2.95 to 3.5:

  http://lists.busybox.net/pipermail/buildroot/2012-April/052880.html

Neither of my patches has been committed yet; just wanted to tie the
threads together here.
