From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 17:52:39 +0100
Subject: [Buildroot] [PATCH 0/24 v3] ejabberd: XMPP server (branch
 yem/ejabberd)
In-Reply-To: <CAJtjsKYdgLhoNujsxrKA1C4yKdvBZFvSfCz-yEC=p7BsPvRy+g@mail.gmail.com>
References: <cover.1415751395.git.yann.morin.1998@free.fr>
 <20141122211947.2d556071@free-electrons.com>
 <CAJtjsKYdgLhoNujsxrKA1C4yKdvBZFvSfCz-yEC=p7BsPvRy+g@mail.gmail.com>
Message-ID: <20141208175239.20fb0274@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Mon, 8 Dec 2014 17:33:13 +0100, Johan Oudinet wrote:

> I've looked into Yann's branch and made some modifications to fix the
> compilation and runtime errors.
> I've also find out and fix the issue with erl_interface, which ld does
> not find if we compile an erlang library after finalizing make once:
> It's because rebar was looking for such libraries in $(TARGET_DIR)
> instead of $(STAGING_DIR), and libraries in TARGET_DIR are deleted by
> the target-finalize Makefile rule.
> How should I share these modifications? I guess I cannot push to
> Yann's git repository.
> Should I send again a patch series, even though Yann has not finished
> its review yet?

You should sync with Yann on this. I guess it would be easier if you
posted new iterations of the patch series, but please coordinate with
Yann about this.

If you're available in the evenings, feel free to come on #buildroot on
Freenode to discuss this with Yann and me.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
