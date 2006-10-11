From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 11 Oct 2006 18:47:07 +0200
Subject: [Buildroot] gettext fixes
In-Reply-To: <87a5b0800610060905v7113e64cr25aea42df284976d@mail.gmail.com>
References: <87a5b0800610060905v7113e64cr25aea42df284976d@mail.gmail.com>
Message-ID: <20061011164707.GA28171@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 06, 2006 at 05:05:49PM +0100, Will Newton wrote:
>Building gettext with the latest buildroot fails. I've attached a
>patch that fixes a couple of issues for me.
>
>1. am_cv_func_working_getline should be defined or the build fails
>with undefined "gnu_getline".
>2. The libintl binary has moved.

Can you please check if gettext-0.15 works better?
Do you use expat?
