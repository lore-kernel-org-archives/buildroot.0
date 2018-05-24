From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 May 2018 18:16:46 +0000
Subject: [Buildroot] [Bug 11046] New: Git package binaries are ~180MB
 (compared to ~20MB in stable branches).
Message-ID: <bug-11046-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11046

            Bug ID: 11046
           Summary: Git package binaries are ~180MB (compared to ~20MB in
                    stable branches).
           Product: buildroot
           Version: unspecified
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: paulstewartis at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7601
  --> https://bugs.busybox.net/attachment.cgi?id=7601&action=edit
Test config from Y Morin.

When I build a config with git enabled with 2018.05-rc2 the git binaries in
/usr/libexec/git-core are over 180MB.  When I build the same config with
2018.02.2 (and all other stable versions I have used over the last few years)
the binaries are ~20MB or less.

Steps to reproduce:
1. Check out 2018.02.2 from git repo
2. Build the attached config.
3. Examine the git-core folder in the image tar file.
4. Check out 2018.05-rc2 from git repo
5. Build the attached config.
6. Examine the git-core folder in the image tar file.

My build system is openSUSE Leap 42.3 fully patched.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
