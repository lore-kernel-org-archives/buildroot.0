From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Feb 2014 09:23:57 +0100
Subject: [Buildroot] [PATCH v2 00/20] Python 2 and 3 bumps,
 support for Python 3 external modules
In-Reply-To: <877g8r34xm.fsf@dell.be.48ers.dk>
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <877g8r34xm.fsf@dell.be.48ers.dk>
Message-ID: <20140219092357.56c76c2f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 19 Feb 2014 09:03:17 +0100, Peter Korsgaard wrote:

>  > Przemyslaw Wrzos (1):
>  >   python, python3: fix to ensure libpython is stripped
> 
>  > Rohan Fletcher (1):
>  >   python-setuptools: bump version to 2.1.2
> 
>  > Thomas Petazzoni (17):
>  >   pkg-python: no longer use distutilscross for setuptools
>  >   python-distutilscross: remove package that is no longer needed
>  >   python3: removal of *.py/*.pyc is now done globally
>  >   python3: make it exclusive from python
>  >   python3: add python -> python3 symlink for the host variant
>  >   python3: use proper PYTHON3_VERSION_MAJOR instead of harcoding 3.3
>  >   python3: bump to 3.4.0rc1
>  >   python3: provide a PYTHON3_PATH
>  >   package: add python3 support in the package infrastructure
>  >   package: allow Python packages with Python3
>  >   python, python3: enable unicodedata for host-python, needed by
>  >     setuptools
>  >   python-pyasn: use the real upstream
>  >   python-bottle: allow to build with Python 3
>  >   python-serial: allow to build with Python 3
>  >   python-pyasn: allow to build with Python 3
>  >   python-pycrypto: allow to build with Python 3
>  >   python-pysnmp{,-apps,-mibs}: allow to build with Python 3
> 
>  > kpa_info at yahoo.fr (1):
>  >   python3: add config directory symbolic link
> 
> Committed the rest of the series (except for patch 6) to next, thanks.

Great, thanks. If there are Python users on the list, please give a
test to the next branch, and see if it works for you. It was a fairly
major bump, so there might be some issues I have overlooked.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
