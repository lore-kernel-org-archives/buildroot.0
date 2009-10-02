From: Will Newton <will.newton@gmail.com>
Date: Fri, 2 Oct 2009 14:14:13 +0100
Subject: [Buildroot] Buildroot and version control systems
In-Reply-To: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAGmhhQKukS5CuVw3jfWJFzEBAAAAAA==@cimeq.qc.ca>
References: <38479127BA626E41B7397B72623101431B7122@mep-server-1.mep.de>
	<!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAANIfWqGxed5Gq+toirCYmVEBAAAAAA==@cimeq.qc.ca>
	<87a5b0800910020604r7f1ace15o55d56c3d824261a@mail.gmail.com>
	<!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAGmhhQKukS5CuVw3jfWJFzEBAAAAAA==@cimeq.qc.ca>
Message-ID: <87a5b0800910020614waeff4a1j7d5c79be04e75241@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 2, 2009 at 2:10 PM, Jonathan dumaresq <jdumaresq@cimeq.qc.ca> wrote:
> Hi Will,
>
>
> I think this is how most people use buildroot - taking the upstream
> version and making local modifications. It should be fairly
> straightforward to do this in any version control system using e.g. in
> CVS a vendor branch, or in git having two branches, one to track
> upstream and one for your changes.
>
> We are using svn as source version control.

Subversion has some notion of vendor branches, e.g.:

http://svnbook.red-bean.com/en/1.1/ch07s05.html

But I am not an svn expert so I can't really help with the details.
