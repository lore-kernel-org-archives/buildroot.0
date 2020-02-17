From: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
Date: Mon, 17 Feb 2020 15:37:59 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-pathlib2: select
 python-scandir
In-Reply-To: <CALFsTFWKxZkoyyxJETMsO1966tm5OGr8aWSWYCX6p4bk9+_fLQ@mail.gmail.com>
References: <20191216194815.5436-1-asafka7@gmail.com>
 <20191222144200.048e1559@windsurf>
 <CALFsTFWKxZkoyyxJETMsO1966tm5OGr8aWSWYCX6p4bk9+_fLQ@mail.gmail.com>
Message-ID: <CADDqny+MWBJGCAQnk3sRjTteXSM63Jtgq8Ki2SrSgYU974WMzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Asaf, All,

On Sun, Dec 22, 2019 at 11:39 AM Asaf Kahlon <asafka7@gmail.com> wrote:
>
> Yeah that's true, but pathlib2 can be chosen only for python 2,
> so we can say for sure it's needed.

I can confirm that pathlib2 will crash on first invocation when using
python2 if BR2_PACKAGE_PYTHON_SCANDIR is not enabled.

Thanks,

Conrad
-- 
Conrad Ratschan | Software Engineer | Commercial Avionics
COLLINS AEROSPACE
400 Collins Road NE, Cedar Rapids, IA 52498, USA
conrad.ratschan at collins.com | collinsaerospace.com

CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.
