From: Ivan Wagner <ivan.wagner@gmail.com>
Date: Thu, 3 Nov 2011 18:33:32 +0100
Subject: [Buildroot]  Migration to the latest stable release
Message-ID: <CA+hj=Mph367-Wcmb+bjSud1hy1e++mB0CF-AQavj8yv3p9BbOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As far as I understand you initialized a local repository starting
from a source copy of buildroot. If you want to sync everything with
buildroot's official repository you should patch everything with diff,
clone buildroot and apply everything. Obviously if you have any
conflicts you will need to manually merge against the branch you
checked out.
