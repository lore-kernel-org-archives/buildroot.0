From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jul 2015 00:11:39 +0200
Subject: [Buildroot] [PATCH 23/38] pulseaudio: systemd support
In-Reply-To: <1dba7a22215e2848dd0bb10a11387c5ef8a3caa0.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
 <1dba7a22215e2848dd0bb10a11387c5ef8a3caa0.1432332802.git.alex.suykov@gmail.com>
Message-ID: <20150715001139.53b866e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Sat, 23 May 2015 13:06:55 +0300, Alex Suykov wrote:
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/pulseaudio/pulseaudio.mk      |  8 ++++++++
>  package/pulseaudio/pulseaudio.service | 11 +++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 package/pulseaudio/pulseaudio.service

Applied after doing some minor changes:

    [Thomas:
     - use relative path for the service symlink
     - slightly adjust the service description]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
