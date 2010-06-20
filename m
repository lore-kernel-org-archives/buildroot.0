From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 20 Jun 2010 19:52:44 +0200
Subject: [Buildroot] [pull request] Pull request for branch linux-cleanup
In-Reply-To: <20100620155140.78e57e4a@surf> (Thomas Petazzoni's message of
	"Sun, 20 Jun 2010 15:51:40 +0200")
References: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<20100620153716.63b1ff25@surf> <20100620155140.78e57e4a@surf>
Message-ID: <874ogxa8wj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> And also :

 Thomas>  * Enable OABI compatibility as well as EABI when EABI is enabled in
 Thomas>    Buildroot configuration

Didn't we just agree that we shouldn't touch the compat option? People
might have good reasons (compatibility) to enable it or not (size).

-- 
Bye, Peter Korsgaard
