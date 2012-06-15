From: Milton Soares Filho <milton.soares.filho@gmail.com>
Date: Fri, 15 Jun 2012 11:57:42 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-06-13
In-Reply-To: <20120615101917.2c757be3@skate>
References: <20120614063146.7563852CEB3@lolut.humanoidz.org>
 <CAPNngRMBN95AdPLA8LrOwUhSVEM1p_VRtTUyf_wbO9T5JHfeFw@mail.gmail.com>
 <20120615101917.2c757be3@skate>
Message-ID: <CAPNngRN=e2BaOgMutb-xiDuy-mxs-sO_6YpJ1sb8ezGr+ZXjLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15 June 2012 05:19, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Yes, I'm thinking of adding a 'toolchain-description.txt' file to every
> build, that would describe the toolchain that has been used (Buildroot
> config used to build the toolchain, CT-NG config used to build the
> toolchain, etc.).
>
> Would this be good for you?

That would be great, Thomas.

Perhaps including another field at the summary just to tell the type
of the toolchain would be enough. The use-case is filter-out
configurations where other users can not easily reproduce the
conditions whether the build has failed, such as custom external
toolchains provided by third-parties or paid-for development kits.

[]s, milton
