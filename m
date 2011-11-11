From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 11 Nov 2011 15:33:39 -0600
Subject: [Buildroot] [git commit branch/next] uClibc: fix sparc build
	breakage
In-Reply-To: <20111111211610.966C58F4EF@busybox.osuosl.org>
References: <20111111211610.966C58F4EF@busybox.osuosl.org>
Message-ID: <201111111533.42857.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri November 11 2011, Peter Korsgaard wrote:
> Fix build breakage for sparc as reported in bug #4021
> Patches from Konrad Eisele <konrad@gaisler.com>
> Submitted in the uclibc mailing list.
> 

Opens a question or two that did not get covered in the
discussion about using a '-next' branch.

A policy statement for when bug reports get cleared?
When -next receives the patch?
Just prior to when the current -next becomes the next -rc?
(I think the second is the current policy.)

In the case of a patch that is submitted upstream and the
additional month of committing patches (beginning in -next);
The chance that 'upstream' will release a revised source
before our -next becomes -rc is greater.

I think the current practice is to revert any patch(s) at the
same time the source version gets bumped.
And, clear any corresponding bug report (if the submitter is
aware of them).

Would it help the bug report review process done just prior
to the -rc version if there was a selectable flag in the
tracker system that let the reviewer select all the reports
subject to "patch sent upstream"?

Mike
