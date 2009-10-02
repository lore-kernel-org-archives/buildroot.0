From: Will Newton <will.newton@gmail.com>
Date: Fri, 2 Oct 2009 14:04:03 +0100
Subject: [Buildroot] Buildroot and version control systems
In-Reply-To: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAANIfWqGxed5Gq+toirCYmVEBAAAAAA==@cimeq.qc.ca>
References: <38479127BA626E41B7397B72623101431B7122@mep-server-1.mep.de>
	<!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAANIfWqGxed5Gq+toirCYmVEBAAAAAA==@cimeq.qc.ca>
Message-ID: <87a5b0800910020604r7f1ace15o55d56c3d824261a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 2, 2009 at 1:57 PM, Jonathan dumaresq <jdumaresq@cimeq.qc.ca> wrote:
> HI,
>
>
>
> I?m in the same boat as you. I just starting a new project with AVR32
> (AP7000) with NGW100 board. And I try to find a good way of working with
> buildroot. We have some customization of buildroot and I have not a really
> good idea of how we will manage this.

I think this is how most people use buildroot - taking the upstream
version and making local modifications. It should be fairly
straightforward to do this in any version control system using e.g. in
CVS a vendor branch, or in git having two branches, one to track
upstream and one for your changes.

It's always best to make sure any changes that you do make are pushed
upstream however, it really will save you time in the long term.
