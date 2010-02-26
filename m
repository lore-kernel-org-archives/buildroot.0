From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Feb 2010 08:44:31 +0100
Subject: [Buildroot] [git commit master] xfont_font-util: convert to the
 autotools infrastructure
In-Reply-To: <4B86AFC2.1010508@carallon.com>
References: <20100223202924.D6947776A1@busybox.osuosl.org>
	<4B86AFC2.1010508@carallon.com>
Message-ID: <20100226084431.4a1fece9@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 25 Feb 2010 17:13:38 +0000
William Wagner <will_wagner@carallon.com> wrote:

> Have just pulled this change and it does not work. The problem is
> that $(@D) is output/build/xfont_font-util-1.0.1 as the rule we are
> currently evaluating is 
> output/build/xfont_font-util-1.0.1/.stamp_staging_installed but the 
> script is in package/x11r7/xfont_font-util

I apologize for the mess. I thought I did test the build after making
the changes, but obviously for xfont_font-util I didn't, which is bad.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
