From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jan 2016 22:39:38 +0100
Subject: [Buildroot] [PATCH 1/1] Add ARM11 MPCore CPU target support
In-Reply-To: <20151227195824.GJ3483@free.fr> (Yann E. MORIN's message of "Sun, 
 27 Dec 2015 20:58:24 +0100")
References: <BLU437-SMTP123CD239C2AFC2F2A7D66EC1020@phx.gbl>
 <20151227195824.GJ3483@free.fr>
Message-ID: <87r3hyl4v9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Sergi, All,
 > On 2015-11-28 15:55 +0100, Sergi Granell spake thusly:
 >> gcc differentiates the mpcore-with-vfp from the mcpore-without-vfp
 >> CPUs. The former is named just 'mpcore', while the latter is named
 >> 'mpcorenovfp'.
 >> 
 >> We only add one entry, 'mpcore' and let the user select whether or
 >> not to use the VFP. We then name the CPU according to the user's
 >> selection.
 >> 
 >> Signed-off-by: Sergi Granell <xerpi.g.12@gmail.com>

 > Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > [yann.morin.1998 at free.fr: build-tested only]
 > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
