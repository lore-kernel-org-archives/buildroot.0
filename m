From: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Date: Fri, 13 Apr 2018 10:00:28 +0200
Subject: [Buildroot] [PATCH 1/1] pixiewps: new package
In-Reply-To: <20180412234222.1f239e48@windsurf>
References: <1523539131-9053-1-git-send-email-guillaume.bressaix@gmail.com>
 <20180412234222.1f239e48@windsurf>
Message-ID: <5ab8b3de-c897-c9bf-a3f4-4de9e3e5f54d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you Thomas,


Le 12/04/2018 ? 23:42, Thomas Petazzoni a ?crit?:
> IXIEWPS_SUBDIR was never defined anywhere, and in fact was not needed
> at all.

yes that was faulty, worked ok but produced an error message, my bad. 
Thank you for removing the non needed line

On 12/04/2018 at 23:42, Thomas Petazzoni wrote:
> Changelog information should not go in the commit log, but...

ok I will keep that in mind for next time


-- 
Guillaume W. Bres,
Software engineer,
NoiseXT,
Elancourt - France
