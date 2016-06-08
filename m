From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 23:50:50 +0200
Subject: [Buildroot] [PATCH RESEND] libiio: Bump version to 0.6
In-Reply-To: <1463765791-308-1-git-send-email-mfornero@mathworks.com>
References: <1460655035-24870-1-git-send-email-mfornero@mathworks.com>
 <1463765791-308-1-git-send-email-mfornero@mathworks.com>
Message-ID: <20160608235050.74fe60e9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 May 2016 13:36:31 -0400, Matthew Fornero wrote:
> v0.6 API offers some major additions, including:
> * iio_device_set_kernel_buffers_counts
> * iio_buffer_get_poll_fd
> * iio_bufer_set_blocking_mode
> * iio_buffer_push_partial
> 
> Signed-off-by: Matthew Fornero <mfornero@mathworks.com>

This update is causing some failures, such as:

   http://autobuild.buildroot.net/results/ffe/ffec14aa79833a6f0889a87b31dae464d083e6a8/build-end.log

Could you have a look at what's going on? This happens in many
configurations:

   http://autobuild.buildroot.net/?reason=libiio-0.6

Thanks for your help!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
