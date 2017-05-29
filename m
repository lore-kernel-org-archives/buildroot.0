From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 21:52:23 +0200
Subject: [Buildroot] [PATCH/next 1/1] lxc: fix hash of patch
In-Reply-To: <4nvtvdxcra.ln2@ID-313208.user.individual.net>
References: <1496044092-78363-1-git-send-email-fontaine.fabrice@gmail.com>
 <20170529121236.5318e2d8@free-electrons.com>
 <CAPi7W83jQ9Z2t9TDLc5ZRo1tmPHF4SkYD86aBAKkOD0=99zwnQ@mail.gmail.com>
 <4nvtvdxcra.ln2@ID-313208.user.individual.net>
Message-ID: <20170529215223.1d3808f9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 May 2017 18:43:48 +0200, Bernd Kuhls wrote:

> afaics there are two more hashes wrong for github patches:
> 
> In package/jack2/jack2.hash
> ff1ed2c4524095055140370c1008a2d9cccc5645.patch
> 
> In package/qt/qt.hash the hash is wrong for
> b8f98d956501dfa4ce03a137f15d404930a56066.patch

Then it would be nice to compare the old and new .patch files, and see
how they differ.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
