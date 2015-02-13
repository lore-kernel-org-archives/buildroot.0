From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Feb 2015 17:59:39 +0100
Subject: [Buildroot] [PATCH] package/python: enable xml libraries
In-Reply-To: <CA+TH9Vmugx-h9hw-Sru5+z1=03vSYyppwJ6JAo4CZOvRghSK7Q@mail.gmail.com>
References: <1423818347-3390-1-git-send-email-angelo.compagnucci@gmail.com>
 <CAGm1_ktnh-NfHS4mXQuE6gk+thaAyT1MB6xE38Km+jqKgW0Jog@mail.gmail.com>
 <CA+TH9V=uZtCW8add7x0cuy90U_NFVkQpDLuJ-HQrQP=uu8iHdQ@mail.gmail.com>
 <CAGm1_kvUryCujDMjvFMBHO4B-+bUS5gP+9T9ea4KU6WP24quTA@mail.gmail.com>
 <CA+TH9Vmugx-h9hw-Sru5+z1=03vSYyppwJ6JAo4CZOvRghSK7Q@mail.gmail.com>
Message-ID: <20150213175939.532c292a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Fri, 13 Feb 2015 10:53:46 +0100, Angelo Compagnucci wrote:

> > Then the existing MACRO should be renamed. Though this implies
> > renaming it in the existing packages, that have this option as
> > dependency like jango etc.
> 
> Yes, probably renaming BR2_PACKAGE_PYTHON_PYEXPAT to
> BR2_PACKAGE_PYTHON_XML makes sense, but it's an intrusive changing.
> I'm offering to volunteer, but I will wait for more comments.

Indeed, the option name is a bit weird. But renaming options is also a
bit annoying. What about only renaming the prompt of the option instead?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
