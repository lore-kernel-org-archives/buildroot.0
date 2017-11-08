From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Nov 2017 13:32:32 +0100
Subject: [Buildroot] [PATCH 1/1] ntp: no longer require openssl
In-Reply-To: <20171108114348.491097e5@windsurf> (Thomas Petazzoni's message of
 "Wed, 8 Nov 2017 11:43:48 +0100")
References: <20171107212906.31336-1-Adamduskett@outlook.com>
 <20171108114348.491097e5@windsurf>
Message-ID: <87fu9peysf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue,  7 Nov 2017 16:29:06 -0500, Adam Duskett wrote:
 >> 4.2.8p10 no longer requires openssl to compile.
 >> 
 >> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>

 > Peter: I'm wondering if we should apply this to next or master. It is
 > not a bug fix per-se, but it fixes a kind of regression introduced with
 > the bump of ntp to 4.2.8p9, which was merged in 2017.02, and brought in
 > OpenSSL as a mandatory dependency. A user reported on Github that it
 > increased quite a lot the installed size (due to the additional OpenSSL
 > dependency).

 > So, I'm tempted to apply this to master. Peter, are you OK?

Yes. I've just applied it. I will also cherry pick to the LTS branch.

-- 
Bye, Peter Korsgaard
