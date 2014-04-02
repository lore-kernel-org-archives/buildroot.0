From: Nathan Ford <nford@westpond.com>
Date: Wed, 02 Apr 2014 09:54:41 -0400
Subject: [Buildroot] init script installation policy
Message-ID: <533C16A1.3080508@westpond.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

What is the policy for installing init scripts when there is already an
init script in the target location? Currently there does not seem to be
any consistency. I bring this up as I updated a project to a newer
buildroot recently and a package I use went from not installing the init
script if it was present, to always installing.

For my projects I use a custom skeleton fs and like the fact that I can
just store my custom init scripts for the packages I use in the skeleton.

Thanks,
--Nate
