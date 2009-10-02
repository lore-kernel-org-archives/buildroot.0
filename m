From: Jonathan dumaresq <jdumaresq@cimeq.qc.ca>
Date: Fri, 2 Oct 2009 09:10:53 -0400
Subject: [Buildroot] Buildroot and version control systems
In-Reply-To: <87a5b0800910020604r7f1ace15o55d56c3d824261a@mail.gmail.com>
References: <38479127BA626E41B7397B72623101431B7122@mep-server-1.mep.de>
	<!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAANIfWqGxed5Gq+toirCYmVEBAAAAAA==@cimeq.qc.ca>
	<87a5b0800910020604r7f1ace15o55d56c3d824261a@mail.gmail.com>
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAGmhhQKukS5CuVw3jfWJFzEBAAAAAA==@cimeq.qc.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Will,


I think this is how most people use buildroot - taking the upstream
version and making local modifications. It should be fairly
straightforward to do this in any version control system using e.g. in
CVS a vendor branch, or in git having two branches, one to track
upstream and one for your changes.

We are using svn as source version control. 

It's always best to make sure any changes that you do make are pushed
upstream however, it really will save you time in the long term.

I will try to find a way to create patch for what is needed as public. Since
I work on the NGW100, I will send you my changed needed to get this work. 

I will look at GIT( new for me) to know how to work with this kind of setup.

Regards

Jonathan
