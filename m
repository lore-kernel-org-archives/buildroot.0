From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Dec 2010 08:58:59 -0300
Subject: [Buildroot] [PATCH 12/13] screen: bump to version 4.0.3
In-Reply-To: <20101223095057.6c7ff091@surf>
References: <1292605474-19443-1-git-send-email-gustavo@zacarias.com.ar>	<1292605474-19443-12-git-send-email-gustavo@zacarias.com.ar>	<20101223083303.07f8a70f@surf>
	<87zkrwsy45.fsf@macbook.be.48ers.dk> <20101223095057.6c7ff091@surf>
Message-ID: <4D133983.5040807@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/23/10 05:50, Thomas Petazzoni wrote:

> Yes, yes, it really wasn't a criticism of Gustavo's work here, not
> at all. Just wondering what this patch does.

Hi.
I'm not quite fond of huge "configure" patches, i'd rather patch
configure.in and autoreconf since it's easier to port to a newer version
later on - though it adds up to a little more build time.
I can give it a shot if we're happy to go this route in the future for
packages.
Regards.
