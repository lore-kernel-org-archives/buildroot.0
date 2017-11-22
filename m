From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 22:45:29 +0100
Subject: [Buildroot] [PATCH] package/google-breakpad: replace references
 to 'struct ucontext' with 'ucontext_t'
In-Reply-To: <20171122210828.19311-1-romain.naour@gmail.com>
References: <20171122210828.19311-1-romain.naour@gmail.com>
Message-ID: <20171122224529.5190424d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for working on this topic!

On Wed, 22 Nov 2017 22:08:28 +0100, Romain Naour wrote:
> Glibc change:
> https://sourceware.org/git/?p=glibc.git;h=251287734e89a52da3db682a8241eb6bccc050c9

This commit log is very, very terse. Could you explain in more details
what's going on?

Also, what is the effect if you use an older glibc version than 2.26 ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
