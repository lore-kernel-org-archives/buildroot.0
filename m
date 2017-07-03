From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Jul 2017 15:14:58 +0200
Subject: [Buildroot] [PATCH] fakedate: simplify logic
In-Reply-To: <93650cbe-f408-0bb7-f926-642d413d60a4@mind.be> (Arnout
 Vandecappelle's message of "Mon, 27 Mar 2017 23:46:43 +0200")
References: <20170207220817.5781-1-peter@korsgaard.com>
 <3055501.XEoAAfpss1@sagittea>
 <93650cbe-f408-0bb7-f926-642d413d60a4@mind.be>
Message-ID: <871spx8xwt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> Hmm... In order to not confuse user, I prefer to keep fakedate as 
 >> original name and adding a symlink beside.

 >  I don't, I think it's clearer as a script than as a symlink.

 >  I don't mind much about the IFS part (it really should have been a separate
 > patch, though), and the tab-space mixup can be fixed up while committing, so

 > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thanks, committed after dropping the IFS part.

-- 
Bye, Peter Korsgaard
