From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 22:33:01 +0200
Subject: [Buildroot] [PATCH 4/6] package/libconfig: switch to github
In-Reply-To: <d68255a1-2b71-5d77-6553-7989a5bbee54@t-online.de>
References: <20170829191005.19697-1-bernd.kuhls@t-online.de>
 <d68255a1-2b71-5d77-6553-7989a5bbee54@t-online.de>
Message-ID: <20170830223301.02d833cd@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Aug 2017 22:19:05 +0200, Bernd Kuhls wrote:

> the two tarballs do not have the same content, I failed to find a github
> hash which is equivalent to the previous tarball so I marked my patch as
> rejected.

Well, the hash will surely be different because a Github generated
tarball will not be the same as the original tarball. However, what
matters is if they are equivalent in terms of source code, i.e what a
"diff -ruN" between both extracted source trees says.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
