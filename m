From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 13 Jul 2011 19:15:21 +0200
Subject: [Buildroot] Depending on uClibc configuration variables
In-Reply-To: <CACTFLAMrGpqoJNJq=2xYwiEi_MY4Eo_JBEf3tHnsVBLfX0R+3w@mail.gmail.com>
 (Daniel Mack's message of "Wed, 13 Jul 2011 18:36:03 +0200")
References: <CACTFLAORWLAkCfzgfMxu_75txKhFiuxNfF4t81nQ5646BMngWw@mail.gmail.com>
 <87mxgifyd1.fsf@macbook.be.48ers.dk>
 <CACTFLAO+rT2UEZ+wJ_8ePQwbbG6m9B4SfPtm8chUzkzS_PoKGw@mail.gmail.com>
 <20110713163105.37f42131@skate>
 <CACTFLAOtkXndrv1G6xkKa1K=_J8bGZi3hBHc9TbkWxUpiYJp4w@mail.gmail.com>
 <20110713182431.1163f950@skate> <87sjqadtwr.fsf@macbook.be.48ers.dk>
 <CACTFLAMrGpqoJNJq=2xYwiEi_MY4Eo_JBEf3tHnsVBLfX0R+3w@mail.gmail.com>
Message-ID: <87oc0ydrva.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@zonque.org> writes:

Hi,

 Daniel> No, I'm still waiting for review and it probably needs one or
 Daniel> more cycles to make it happen.

 Daniel> I'm just preparing patches for buildroot in parallel, and came
 Daniel> across this problem. So for the first shot, we would depend on
 Daniel> a BR2 snapshot, and once a new release is ready, add this as
 Daniel> dependency option. Correct?

Either that or backport it to 0.9.32.

-- 
Bye, Peter Korsgaard
