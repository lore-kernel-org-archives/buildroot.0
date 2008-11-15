From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 15 Nov 2008 14:32:44 +0100
Subject: [Buildroot] [PATCH] Create "Shells" package category
In-Reply-To: <B675007D-8CE2-48C7-9F49-241B967F30C7@valka.is>
References: <B675007D-8CE2-48C7-9F49-241B967F30C7@valka.is>
Message-ID: <200811151432.44932.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnar Mar Sig, 14.11.2008:
> First of the package menu cleanup.
> 
> Create a new package sub menu named "Shells" and move bash into it.

Why do you begin with a category containing only a single package? Dash is
also a shell, then there would be two, but we shouldn't end up with a bunch of
categories containing only a few packages. Buildroot doesn't contain as much
packages as FreeBSD or Gentoo, so I'd rather suggest some less specific
categories like "system utils" or so.

Markus
