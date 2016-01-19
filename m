From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2016 19:35:40 +0100
Subject: [Buildroot] [PATCH v9] toolchain: create symlink
	ARCH_LIB_DIR->lib in addition to lib32/lib64->lib
In-Reply-To: <20160119182947.GB3360@free.fr> (Yann E. MORIN's message of "Tue, 
 19 Jan 2016 19:29:47 +0100")
References: <1450787734-2547-1-git-send-email-patrickdepinguin@gmail.com>
 <20160117154528.1bb05d3e@free-electrons.com>
 <CAAXf6LVkS49xBPa80iqi0EbkausB2gYJRJodsPMoWR8n6LZaAg@mail.gmail.com>
 <CAAXf6LUUwQ4yt38Cy+A5QpL+kXhGmd9iiBvJLdNA8uJDv=TpMA@mail.gmail.com>
 <87lh7l3asr.fsf@dell.be.48ers.dk>
 <CAAXf6LUqCv04ZkCH5fKwq2_0w9hBYFYXM_Bf5t1yawG1D8yeTQ@mail.gmail.com>
 <20160119182947.GB3360@free.fr>
Message-ID: <878u3l2z9f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

>> I was not aware that glibc already depends on skeleton. Then indeed
 >> ThomasP's reasoning is correct and the patch should be simplified. I
 >> will investigate that further and resubmit.

 > Skeleton is currently not a dependency of host-gcc-initial, so you'd
 > have to make it so.

Ahh yes, we only add it for target packages.

-- 
Venlig hilsen,
Peter Korsgaard 
