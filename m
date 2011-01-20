From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 20 Jan 2011 13:25:09 -0300
Subject: [Buildroot] [PATCH v3] udev: bump version to 164,
 add optional support for all extras, depend on host-gperf
In-Reply-To: <4D33D762.4010502@ethertek.ca>
References: <25c844f9547462b4cc5b7a27a80562c4df29ddc5.1293377040.git.smiley73@users.sourceforge.net>
	<4D2DFA62.4070000@zacarias.com.ar> <4D33D762.4010502@ethertek.ca>
Message-ID: <4D3861E5.6080400@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/17/11 02:45, Dan Pattison wrote:

> Hello,
> 
> I would like your udev support patches for uclibc-0.9.30.1 please, so I
> could use a newer udev.
> 
> Thank you,
> 
> Dan Pattison

Try to keep replies on the list.
From a quick test the same patches apply to 0.9.30.3, so they should
probably apply to 0.9.30.1 too.
If it works and other things aren't missing from the 0.9.30 series is
completely unknown to me, i have no need to stick with old versions.
Buildroot-wise 0.9.32 will probably be out soon (-rc2 out today) so
there really isn't much interest in backporting things for 0.9.30.
Regards.
