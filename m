From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 02 Oct 2018 21:50:04 -0300
Subject: [Buildroot] [PATCH v3 2/2] support/scripts/pkg-stats: URL check
 using threads
References: <1538447849-46511-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <5bb4123cbed5b_6f723fa9ec08e7bc6558f@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Oct 01, 2018 at 11:37 PM, Matt Weber wrote:

> Adds a pool of worker threads to accelerate connection testing.
> 
> ~7.5MB and 2% CPU per thread on a Intel i5-3230M CPU @ 2.60GHz.
> 
> Runtime is ~3min in parallel vs ~15min.
> 
> CC: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>


Regards,
Ricardo
