From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 13 Feb 2015 18:03:43 +0100
Subject: [Buildroot] [PATCH] package/python: enable xml libraries
In-Reply-To: <20150213175939.532c292a@free-electrons.com>
References: <1423818347-3390-1-git-send-email-angelo.compagnucci@gmail.com>
 <CAGm1_ktnh-NfHS4mXQuE6gk+thaAyT1MB6xE38Km+jqKgW0Jog@mail.gmail.com>
 <CA+TH9V=uZtCW8add7x0cuy90U_NFVkQpDLuJ-HQrQP=uu8iHdQ@mail.gmail.com>
 <CAGm1_kvUryCujDMjvFMBHO4B-+bUS5gP+9T9ea4KU6WP24quTA@mail.gmail.com>
 <CA+TH9Vmugx-h9hw-Sru5+z1=03vSYyppwJ6JAo4CZOvRghSK7Q@mail.gmail.com>
 <20150213175939.532c292a@free-electrons.com>
Message-ID: <CA+TH9V=hOkD3pGtHLyYY77q=i_f9cd5-wo8hYNeV+TbsWKuRsw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2015-02-13 17:59 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Angelo Compagnucci,
>
> On Fri, 13 Feb 2015 10:53:46 +0100, Angelo Compagnucci wrote:
>
>> > Then the existing MACRO should be renamed. Though this implies
>> > renaming it in the existing packages, that have this option as
>> > dependency like jango etc.
>>
>> Yes, probably renaming BR2_PACKAGE_PYTHON_PYEXPAT to
>> BR2_PACKAGE_PYTHON_XML makes sense, but it's an intrusive changing.
>> I'm offering to volunteer, but I will wait for more comments.
>
> Indeed, the option name is a bit weird. But renaming options is also a
> bit annoying. What about only renaming the prompt of the option instead?

Why not! I think solves both problems and makes clear that
BR2_PACKAGE_PYTHON_PYEXPAT enables all python xml modules.
I'll prepare a patch in minutes!

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
