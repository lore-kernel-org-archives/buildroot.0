From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 10:10:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/zstd: bump to version 1.4.5
In-Reply-To: <CAPi7W819ZdkSdBjPmiKkKOmVuresGfrTF229ipCqnLEJH4z+xw@mail.gmail.com>
 (Fabrice Fontaine's message of "Wed, 22 Jul 2020 09:18:03 +0200")
References: <20200714202850.1441606-1-fontaine.fabrice@gmail.com>
 <87lfjcja5s.fsf@dell.be.48ers.dk>
 <CAPi7W819ZdkSdBjPmiKkKOmVuresGfrTF229ipCqnLEJH4z+xw@mail.gmail.com>
Message-ID: <87sgdkhsw7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Hi Peter,
 > Le mer. 22 juil. 2020 ? 09:12, Peter Korsgaard <peter@korsgaard.com> a ?crit :
 >> 
 >> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> 
 >> > - Get official tarball and its hash
 >> > - Update indentation in hash file (two spaces)
 >> 
 >> > This is a fairly important release which includes performance
 >> > improvements and new major CLI features. It also fixes a few corner
 >> > cases, making it a recommended upgrade.
 >> 
 >> > https://github.com/facebook/zstd/releases/tag/v1.4.5
 >> > https://github.com/facebook/zstd/releases/tag/v1.4.4
 >> 
 >> Does this mean that it should be applied to 2020.02.x / 2020.05.x as
 >> well?
 > Yes, I think it should also be applied to 2020.02.x / 2020.05.x with
 > commit 267ce1718edccacdf02bc68b651ba5f8ffe72fa9.

Ok, I will do that then - Thanks!

-- 
Bye, Peter Korsgaard
