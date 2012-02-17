From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 17 Feb 2012 14:50:40 +0100
Subject: [Buildroot] Report of the Buildroot Developer Day, February 3,
 2012 - Legal info
In-Reply-To: <BE5319E74F9A446BA391A54D7377663E@beraninstruments.com.local>
References: <201202160044.29316.arnout@mind.be>
 <BE5319E74F9A446BA391A54D7377663E@beraninstruments.com.local>
Message-ID: <4F3E5B30.60007@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will Moore wrote:
...
> Implementation
>
>    * Add our advise of how to comply to GPL to the documentation.
>    * If something is difficult to do, skip it and mention it to the
>      user.
>    * In the package mk-file, specify the license file(s) from the
>      package source that have to be included. There are some cases
>      where the source doesn?t have a separate license file. In this
>      case, we can include a license file in buildroot?s package
>      directory. We could also point to a source file that contains the
>      license text (not ideal because you add redundant cruft to the
>      legal-info directory).
>    * To avoid duplicating the same license every time, we use a common
>      license file (included only once) for known licenses (GPLv2,
>      LGPLv2, LGPLv2.1, ?). This only applies for licenses for which
>      the text always is identical. In particular, the BSD license is
>      excluded because it explicitly states that the copyright
>      statement above must be retained.
> Having just recently gone through doing this for a simple buildroot
> configuration I would note that even when things are e.g. GPLv2 they have
> different license text.  Not only do they often have (a la Linux) a little
> explanation before the text of the GPLv2 but also the GPLv2 text itself can vary
> subtly even when both versions are marked Version 2, June 1991.  In the cases I
> saw just silly things like the address given for FSF and "19yy" changing to
> "year", "St" to "Street", "Lesser" to "Library", and white space changes.  To be
> "clean" I just copied the license verbatim from the source.

You're right. In fact I noticed this fact when trying to implement the said
feature. For the moment I chose to leave it out of my next patchset, and
start a little more discussion about the issue.

Luca
