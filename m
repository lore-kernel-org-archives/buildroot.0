From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Mar 2020 12:06:31 +0100
Subject: [Buildroot] [PATCH 2/3] Makefile: fix package file list if
 FOO_SUBDIR is set
In-Reply-To: <CAAXf6LXBd1nK56h9eyymw1ck7zpVW_hQ4MYm6_eOkd3eyqu8hQ@mail.gmail.com>
 (Thomas De Schampheleire's message of "Sat, 28 Mar 2020 09:58:16
 +0100")
References: <20200318155814.567-1-patrickdepinguin@gmail.com>
 <20200318155814.567-2-patrickdepinguin@gmail.com>
 <87v9mpc4ik.fsf@dell.be.48ers.dk>
 <CAAXf6LXBd1nK56h9eyymw1ck7zpVW_hQ4MYm6_eOkd3eyqu8hQ@mail.gmail.com>
Message-ID: <87mu80d9hk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 >> Committed to 2020.02.x, thanks.
 >> 
 >> This is not applicable to the older releases, right?
 >> 

 > No indeed, I think this code that handles the file lists differently was
 > new in 2020.02.

Ok, thanks!

-- 
Bye, Peter Korsgaard
