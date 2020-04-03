From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 03 Apr 2020 13:09:42 +0000
Subject: [Buildroot] [Bug 12746] New: "sysdig" package description points to
 http://sysdig.org, which bounces to malware site
Message-ID: <bug-12746-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12746

            Bug ID: 12746
           Summary: "sysdig" package description points to
                    http://sysdig.org, which bounces to malware site
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: griscom at suitable.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

It isn't clear from the package description what the "sysdig" package is, so I
went to the url http://sysdig.org listed in the description. Unfortunately,
that shows a page with a "The domain sysdig.org may be for sale" header, and
then quickly bounces through several other domains, landing in a
probably-dangerous website offering a "security check":

"By clicking the button below you'll go through a standard security check,
after which you will be redirected to Chrome store and will be given the option
to install Secured Search extension. This extension will offer you a safer web
search experience by changing your default search provider."

At the least the bad URL should be removed; best would be to redirect it to an
available website that describes the package (or removal of the package
altogether).

ref: https://git.buildroot.net/buildroot/tree/package/sysdig/Config.in

-- 
You are receiving this mail because:
You are on the CC list for the bug.
