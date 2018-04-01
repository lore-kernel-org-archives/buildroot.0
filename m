From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 18:45:53 +0200
Subject: [Buildroot] [PATCH v2 2/2] gst1-interpipe: new package
In-Reply-To: <20171027171622.16050-2-ps.report@gmx.net> (Peter Seiderer's
 message of "Fri, 27 Oct 2017 19:16:22 +0200")
References: <20171027171622.16050-1-ps.report@gmx.net>
 <20171027171622.16050-2-ps.report@gmx.net>
Message-ID: <87po3iri2m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Changes v1 -> v2:
 >   - add hash for the license file
 > ---
 >  package/gstreamer1/Config.in                       |  1 +
 >  package/gstreamer1/gst1-interpipe/Config.in        | 10 +++++++++
 >  .../gstreamer1/gst1-interpipe/gst1-interpipe.hash  |  5 +++++
 >  .../gstreamer1/gst1-interpipe/gst1-interpipe.mk    | 24 ++++++++++++++++++++++

Sorry, I forgot to mention that I also added an entry in DEVELOPERS for
this.

-- 
Bye, Peter Korsgaard
