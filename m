From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed, 12 Dec 2018 20:01:11 +0100
Subject: [Buildroot] <PKG>_SOURCE without a version?
Message-ID: <CAJtjsKZ8j6x9cHEuCZVuYu0YVcYZjzxM4vYpbPek+PZ7cC7cvQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm packaging a project which distributes its sources without a
version number in the filename. The version is present in the URL, but
I'm wondering if the download architecture can handle a version bump
properly, or if it would stick to the file in <PKG>_DL_DIR from an
older version?

Looking at the other packages, I found package/jquery-sparkline that
has the same "issue".
Its version has been bump several times. So either this is a bug and
no one noticed it until now, or the download step can detect somehow
when it has to download the file again?

Best,
-- 
Johan
