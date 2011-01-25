From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Jan 2011 00:26:40 +0100
Subject: [Buildroot] [PATCH v2 4/4] cdrkit: convert to CMAKETARGETS
 infrastructure
In-Reply-To: <AANLkTimn-g5Djk2c+1BHfCUMkYth9VOf+zj+UaF-8Y9u@mail.gmail.com>
References: <1295124808-5649-1-git-send-email-bjorn.forsman@gmail.com>
	<1295124808-5649-5-git-send-email-bjorn.forsman@gmail.com>
	<AANLkTi=XYYi_M7W1_NAdnV+WW9iFftEZ5+uYL3CCtoym@mail.gmail.com>
	<AANLkTimn-g5Djk2c+1BHfCUMkYth9VOf+zj+UaF-8Y9u@mail.gmail.com>
Message-ID: <20110126002640.5cd5de9f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 23 Jan 2011 15:42:08 +0100
Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:

> The reason it was included in v1 was that cdrkit.mk had it (which I
> based this on) and I did an early release :-) Maybe Thomas (original
> cdrkit.mk author) has any comments?

No, no specific comment: I'm a CMake newbie, so I didn't know exactly
what the variable type was used for. If it's only for some
CMake-specific GUI, then yes, they are probably useless in Buildroot.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
