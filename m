From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 18 Jan 2017 10:46:15 +0100
Subject: [Buildroot] Add Python module
In-Reply-To: <1080260686.3554351484732629040.JavaMail.httpd@webmail-40.iol.local>
References: <1080260686.3554351484732629040.JavaMail.httpd@webmail-40.iol.local>
Message-ID: <CAGm1_ktXXJvrmu15hJDQAUozgrNTkv-5NNQhTYnTCEpDs+13=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simone,

On Wed, Jan 18, 2017 at 10:43 AM, sred_94 at libero.it <sred_94@libero.it> wrote:
> Dear Sirs,
>
> I have to import a Python module which is not present on buildroot. How can
> I do it properly?

Just read the whole section about Python packages:
http://nightly.buildroot.org/manual.html#_infrastructure_for_python_packages

Then start with "17.8.3. Generating a python-package from a PyPI
repository" if your package is on PyPI.

Yegor
