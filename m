From: Asaf Kahlon <asafka7@gmail.com>
Date: Sun, 12 Jan 2020 21:15:12 +0200
Subject: [Buildroot] What do we want to do with Python2?
Message-ID: <CALFsTFUYfPhOaJTei-sGrbNNY1WBP1TG55UyZywPys_3R3E=Kw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As we all know, from the beginning of this year, Python2 is not
officially maintained anymore.
In addition, some major python packages started to drop support for
Python2 recently. One example is the latest setuptools release
(45.0.0) which added 'python_requires` validation for Python 3.5 or
later.

Do we have any plan for removing Python2 support in Buildroot? If so,
do we know for which version we want it to be relevant?
Of course, I'll be more than happy to help with the process.

Thanks,
Asaf.
