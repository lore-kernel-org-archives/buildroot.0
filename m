From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 12 Mar 2016 15:55:52 +0100
Subject: [Buildroot] [PATCH 1/1] olimex_imx233_olinuxino_defconfig:
	genimage support
In-Reply-To: <CAPiYbRLgfTDF4D6noo0iu5HmzyKUJrkWGywqL_FU8zFZ=hXB7A@mail.gmail.com>
 (Phil Eichinger's message of "Sat, 12 Mar 2016 14:52:42 +0100")
References: <1457645651-2472-1-git-send-email-phil@zankapfel.net>
 <87shzxi54b.fsf@dell.be.48ers.dk> <56E3E205.8090701@mind.be>
 <87vb4sggzp.fsf@dell.be.48ers.dk>
 <CAPiYbRLgfTDF4D6noo0iu5HmzyKUJrkWGywqL_FU8zFZ=hXB7A@mail.gmail.com>
Message-ID: <87r3ffhhjb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Phil" == Phil Eichinger <phil.eichinger@gmail.com> writes:

Hi,

 >> >  So, why doesn't Travis detect that?
 >> 
 >> Presumably because the Ubuntu container has mkdosfs installed?

 > I looked into it, on my system mkdosfs was installed, that's why I was
 > able to generate the image.
 > Is a fallback to system mkdosfs considered a feature or should
 > genimage only use Buildroot's mkdosfs?

We want the builds to be reproducible on other machines, so we should be
able to build with only the programs available we check for in
dependencies.sh

-- 
Venlig hilsen,
Peter Korsgaard 
