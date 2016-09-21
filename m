From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Sep 2016 09:17:45 +0200
Subject: [Buildroot] [PATCH v3 4/4] docs/manual: add new section about
	the DEVELOPERS file and get-developer
In-Reply-To: <1473713695-2611-5-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 12 Sep 2016 22:54:55 +0200")
References: <1473713695-2611-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1473713695-2611-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871t0dzppi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  docs/manual/contribute.txt |  6 ++++++
 >  docs/manual/developers.txt | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 >  docs/manual/manual.txt     |  2 ++
 >  3 files changed, 54 insertions(+)
 >  create mode 100644 docs/manual/developers.txt

 > diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
 > index 2973ef7..a8f9db7 100644
 > --- a/docs/manual/contribute.txt
 > +++ b/docs/manual/contribute.txt
 > @@ -258,6 +258,12 @@ removed, preferably with the upstream commit ID. Also any other
 >  required changes should be explained explicitly, like configure
 >  options that no longer exist or are no longer needed.
 
 > +If you are interested in getting notified of build failures and of
 > +further changes in the packages you added or modified, please add
 > +yourself to the DEVELOPERS file. This should be done in a separate
 > +patch of the series. See xref:DEVELOPERS[the DEVELOPERS file] for more
 > +information.

Committed after tweaking the wording and adding an xref like suggested
by Arnout, thanks.

-- 
Bye, Peter Korsgaard
