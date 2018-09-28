From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 28 Sep 2018 10:48:03 -0500
Subject: [Buildroot] [PATCH v1 1/1] package/proftpd: add mod_{sql,
 quotatab} support
In-Reply-To: <CAM=7fbcnJp17k-D8P3MoJ-+3KvjzqUFhACYGbKKmyhM6mn1sMA@mail.gmail.com>
References: <1538148185-7313-1-git-send-email-jared.bents@rockwellcollins.com>
 <CAM=7fbcnJp17k-D8P3MoJ-+3KvjzqUFhACYGbKKmyhM6mn1sMA@mail.gmail.com>
Message-ID: <CANQCQpbY6Z7U222uKvqU69Z4WRMa63_k+pJ3SyQrV1_T67HzrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jared,

On Fri, Sep 28, 2018 at 10:46 AM Jared Bents
<jared.bents@rockwellcollins.com> wrote:
>
> On Fri, Sep 28, 2018 at 10:23 AM Jared Bents
> <jared.bents@rockwellcollins.com> wrote:
> >
> > From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> >
> >  - Enables mod_sql which is required for quotatab
> >  - Adds options for enabling mod_quotatab and the sub-component
> >    file/LDAP/RADIUS/SQL modules
> >  - Copies over ftpasswd and ftpquota scripts if perl is enabled
> >    (These scripts aren't required and the feature works
> >     without them installed)
> >

Here's the original v1 that needs some updates
http://patchwork.ozlabs.org/patch/970804/
