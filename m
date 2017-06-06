From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Jun 2017 15:46:09 +0200
Subject: [Buildroot] [PATCH 2/2] package/ffmpeg: fix static linking with
	alsa
In-Reply-To: <20170606153559.6a0c6b35@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 6 Jun 2017 15:35:59 +0200")
References: <20170601203930.1069-1-bernd.kuhls@t-online.de>
 <20170601203930.1069-2-bernd.kuhls@t-online.de>
 <20170605144812.36b6f0e3@free-electrons.com>
 <871sqxe1xb.fsf@dell.be.48ers.dk>
 <20170606145122.0b36d3cb@free-electrons.com>
 <87wp8pcknl.fsf@dell.be.48ers.dk>
 <20170606153559.6a0c6b35@free-electrons.com>
Message-ID: <87shjdcjq6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue, 06 Jun 2017 15:26:06 +0200, Peter Korsgaard wrote:

 >> > Because right now, the library produced by alsa-lib is broken, and this
 >> > is worked around in packages using alsa-lib rather than alsa-lib itself.  
 >> 
 >> True. Will you fix it or do you want me to send a patch?

 > Depends what fix we're talking about. Work around in
 > alsa-lib/Config.in, or proper fix in alsa-lib source code?

Either ;) The source code change is imho more of a nice-to-have thing as
nobody has brought it up in the ~two years we had the workaround, but if
you feel up to it..

-- 
Bye, Peter Korsgaard
