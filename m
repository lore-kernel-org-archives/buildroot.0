From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Jun 2013 17:49:04 +0200
Subject: [Buildroot] [PATCH] sconeserver: fix autouild failure
In-Reply-To: <1370261409-8722-1-git-send-email-spdawson@gmail.com>
References: <1370261409-8722-1-git-send-email-spdawson@gmail.com>
Message-ID: <20130608174904.0559f1be@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear spdawson at gmail.com,

On Mon,  3 Jun 2013 13:10:09 +0100, spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
> 
> Fixes autobuild failures such as the following.
> 
>   http://autobuild.buildroot.net/results/1bdb5e014daf76b701afea5c82ac83ac4c97d4cb/
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>

There are still build failures related to sconeserver and MySQL. See
http://autobuild.buildroot.org/results/a16/a162fbd8977faa561a76f76072ec3335fb8e8d1f/build-end.log.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
