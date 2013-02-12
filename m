From: Patrick Gerber <kpa_info@yahoo.fr>
Date: Tue, 12 Feb 2013 15:13:56 +0100
Subject: [Buildroot] [PATCH v2] Python 3, simple, external package support
Message-ID: <1360678441-3199-1-git-send-email-kpa_info@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series refactor python support in buildroot to enable the use of
from line 'This patch series refactor python support in buildroot to enable
the use of external package with both python2 and python3. The packages 
python-bottle and python-serial have adapted as examples.

To support others external package more work is needed as they are based on
python setuptools. It's no more supported by python3 and should be replaced
by "Distribute". This should be done in another patch series.

v2: Add short patch title
