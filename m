From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Tue, 14 Aug 2012 23:39:09 -0400
Subject: [Buildroot] [PATCH 2/2] Provide PAM configuration files in the
	fs skeleton
In-Reply-To: <20120814154110.4a74a4e1@skate>
References: <1344911089-31197-1-git-send-email-golubovsky@gmail.com>
 <1344911089-31197-2-git-send-email-golubovsky@gmail.com>
 <20120814154110.4a74a4e1@skate>
Message-ID: <CADiAo4L2cW4HQ8X6=BNQs_V8n=+Qr38pde4HPCE_m2LHn9aNEA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Aug 14, 2012 at 9:41 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> I'm not sure we want these in the default fs skeleton. Shouldn't the
> linux-pam package install these instead?
>

I have resent the patch: now these PAM config files are part of the
linux-pam package files. The reason why they are copied in a
post-patch hook: $(RAWNAME) does not seem to be available inside
post-install hooks.

Hope this is an acceptable way to distribute non-patch files along
with package itself, or is there a better way?

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
