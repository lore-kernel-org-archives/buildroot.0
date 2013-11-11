From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 11 Nov 2013 22:43:23 +0100
Subject: [Buildroot] Report of buildroot developer meeting (Oct 26-27 2013,
	Edinburgh)
Message-ID: <52814F7B.4050409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi all,

  I finally added the report of the BR developer meeting to the wiki. You 
can find it at http://elinux.org/Buildroot:DeveloperDaysELCE2013

  Feel free to ask the attendees for clarifications if necessary.

  Here is a summary of the conclusions of the meeting.

* Google Summer of Code: this first project was a mixed success, but we 
will do it again next year.

* Community organization:
  - Maintainers should take patches in ready-to-commit branches and send 
them out to the list, and update patchwork to supersede the patches you 
included.
  - Peter should force decisions on major changes when he is asked to.
  - Yann will add a feature to patchwork that makes Acked-by tags visible 
in the front-end web and pwclient interface.
  - We will continue the weeding of old patches with bi-weekly request 
for update.
  - We will try to get a "new contributor" to work on a checkpackage script.

* We can probably remove the experimental tag from (e)glibc.

* The BR2_EXTERNAL patches will be accepted (after some more 
modifications). The directory hierarchy in the external tree will be 
forced to follow the patches/, configs/ and board/ structure (though the 
board/ is of course not forced).

* We will start adding 'demo' configs (i.e. non-minimal configs) in the 
configs/ directory. They may move to another place later.

* We will add test cases in the support/test directory.

* Support for maintaining package patches using quilt or git will be 
added when someone contributes scripts for it.

* Config.in.legacy will be kept as it is now, until someone contributes a 
script that automatically updates .config instead.

* We won't do anything for SPDX support for the time being. Only if a 
package carries a license that is not in our current list, we can use the 
SPDX shortname for it.

* Yann will adapt and re-send the instrumentation patches.

* The parallel top-level make patches will be accepted, except the one 
that removes .NOTPARALLEL.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
