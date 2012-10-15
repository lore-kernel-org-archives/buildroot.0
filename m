From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 15 Oct 2012 14:49:40 -0300
Subject: [Buildroot] Git download is currently broken
Message-ID: <CAExDhvZGg+VBSx3aP73yG8er9ppqEfL4FrmcoQbn4OT5xcVi8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

     I've noticed that the generic-package Git download method is
broken, but I haven't been able to figure out why. Even packages
already included in buildroot will download from the buildroot.net
mirror instead of git.

     This is what I get from a package I'm trying to submit for
inclusion, which of course isn't in the buildroot.net mirror (below)
     Any help would be apreciated. Thanks.

Kind Regards,
     Thiago A. Correa

localhost buildroot-mainstream # make
>>> qtserialport e831107f468618881e435932c8a42404c1dde13c Downloading
Too many arguments.

usage: git clone [options] [--] <repo> [<dir>]

    -v, --verbose         be more verbose
    -q, --quiet           be more quiet
    --progress            force progress reporting
    -n, --no-checkout     don't create a checkout
    --bare                create a bare repository
    --mirror              create a mirror repository (implies bare)
    -l, --local           to clone from a local repository
    --no-hardlinks        don't use local hardlinks, always copy
    -s, --shared          setup as shared repository
    --recursive           initialize submodules in the clone
    --template <path>     path the template repository
    --reference <repo>    reference repository
    -o, --origin <branch>
                          use <branch> instead of 'origin' to track upstream
    -b, --branch <branch>
                          checkout <branch> instead of the remote's HEAD
    -u, --upload-pack <path>
                          path to git-upload-pack on the remote
    --depth <depth>       create a shallow clone of that depth

--2012-10-15 14:45:17--
http://buildroot.uclibc.org/downloads/sources//qtserialport-e831107f468618881e435932c8a42404c1dde13c.tar.gz
Resolving buildroot.uclibc.org... 140.211.167.224
Connecting to buildroot.uclibc.org|140.211.167.224|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: http://sources.buildroot.net//qtserialport-e831107f468618881e435932c8a42404c1dde13c.tar.gz
[following]
--2012-10-15 14:45:18--
http://sources.buildroot.net//qtserialport-e831107f468618881e435932c8a42404c1dde13c.tar.gz
Resolving sources.buildroot.net... 176.9.16.109
Connecting to sources.buildroot.net|176.9.16.109|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2012-10-15 14:45:18 ERROR 404: Not Found.
