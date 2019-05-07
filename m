From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 May 2019 23:02:06 +0200
Subject: [Buildroot] [PATCH v1 01/28] package/assimp: replace utf-8
 quote by ascii single quote
In-Reply-To: <20190507225224.6cde6018@windsurf> (Thomas Petazzoni's message of
 "Tue, 7 May 2019 22:52:24 +0200")
References: <20190507203548.10337-1-ps.report@gmx.net>
 <20190507225224.6cde6018@windsurf>
Message-ID: <87v9ymkmgh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello Peter,
 > On Tue,  7 May 2019 22:35:21 +0200
 > Peter Seiderer <ps.report@gmx.net> wrote:

 >> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 >> ---
 >> package/assimp/assimp.mk | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)

 > Thanks for all those patches. I think it would be useful to extend the
 > check-package logic to check that such UTF-8 quotes/spaces don't get
 > re-added.

Agreed!

-- 
Bye, Peter Korsgaard
