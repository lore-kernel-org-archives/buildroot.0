From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 13 Jul 2011 18:31:16 +0200
Subject: [Buildroot] Depending on uClibc configuration variables
In-Reply-To: <20110713182431.1163f950@skate> (Thomas Petazzoni's message of
 "Wed, 13 Jul 2011 18:24:31 +0200")
References: <CACTFLAORWLAkCfzgfMxu_75txKhFiuxNfF4t81nQ5646BMngWw@mail.gmail.com>
 <87mxgifyd1.fsf@macbook.be.48ers.dk>
 <CACTFLAO+rT2UEZ+wJ_8ePQwbbG6m9B4SfPtm8chUzkzS_PoKGw@mail.gmail.com>
 <20110713163105.37f42131@skate>
 <CACTFLAOtkXndrv1G6xkKa1K=_J8bGZi3hBHc9TbkWxUpiYJp4w@mail.gmail.com>
 <20110713182431.1163f950@skate>
Message-ID: <87sjqadtwr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Wed, 13 Jul 2011 16:36:28 +0200,
 Thomas> Daniel Mack <daniel@zonque.org> a ?crit :

 >> > What is the binary size impact of having your option enabled in uClibc ?
 >> 
 >> It adds ~5kb.

 Thomas> Then I would say that we can include the feature in our default uClibc
 Thomas> configuration.

But it's the uClibc patches Daniel recently posted, isn't it? Those
afaik aren't integrated in uClibc git yet.

-- 
Bye, Peter Korsgaard
