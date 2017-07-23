From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jul 2017 10:10:22 +0200
Subject: [Buildroot] [PATCH v10 0/3] Make the SDK relocatable
In-Reply-To: <20170722144146.28f826b1@windsurf> (Thomas Petazzoni's message of
 "Sat, 22 Jul 2017 14:41:46 +0200")
References: <1500722142-20420-1-git-send-email-wg@grandegger.com>
 <20170722144146.28f826b1@windsurf>
Message-ID: <8760ejpo9d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Sat, 22 Jul 2017 13:15:39 +0200, Wolfgang Grandegger wrote:

 >> Wolfgang Grandegger (3):
 >> core: introduce "sdk" target to make a relocatable SDK
 >> support/scripts/fix-rpath: check if the patchelf utility is executable
 >> support/scripts/fix-rpath: typo fix and unneeded ";" removed

 > Thanks a lot, I've applied those remaining 3 patches!

 > I would like to take this opportunity to thank you for your patience
 > and your dedication in pushing this SDK topic. It's been long overdue
 > in Buildroot, and the fact that you have taken all comments into
 > account and sent quickly new iterations was really instrumental to
 > getting the all thing finally merged. So: many thanks!

Yes, from me as well - Thanks a lot!

-- 
Bye, Peter Korsgaard
