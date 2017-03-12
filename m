From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 12 Mar 2017 19:43:04 -0300
Subject: [Buildroot] QT5.8 buid failure on master
In-Reply-To: <CAAMH-ytGnurAFt=BcfK53qJ8OR09o8LAZK2UdCH7nO-1Q=2aQg@mail.gmail.com>
References: <CAOMZO5D_R7_zEzL-X2zPViU+-SZ060JA3hpnE9S01x2PRazUsQ@mail.gmail.com>
 <trinity-a4f8806b-d789-4dea-928a-2d7bb2fad531-1488871993989@3capp-gmx-bs12>
 <20170307114826.lend2f2evnob3lya@t450s.lan>
 <trinity-b0ce3807-d5c4-4ccf-9b54-628667f6d805-1488895453975@3capp-gmx-bs26>
 <CAD6G_RQiqhvnYX3L9wh64K5inCSNr4G-vPDzU_9BbLqzrw=fyQ@mail.gmail.com>
 <CAOMZO5CPz7tLtLeLpC82koCrWx-gYRUGrZ-v-qjuZOZ3wbkaXw@mail.gmail.com>
 <20170307202950.61328dd5@gmx.net>
 <CAAMH-ytGnurAFt=BcfK53qJ8OR09o8LAZK2UdCH7nO-1Q=2aQg@mail.gmail.com>
Message-ID: <CAOMZO5BdAeVjxVEXcDq5rWS=4XhqF1qJ_hZQA9e3H_NFG+mAJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

On Wed, Mar 8, 2017 at 7:45 AM, Gary Bisson
<gary.bisson@boundarydevices.com> wrote:

> However, I've made a discovery regarding the DRI configuration (to
> avoid hardcoding the device). It is actually documented well on Qt
> website:
> http://doc.qt.io/qt-5/embedded-linux.html#eglfs-with-eglfs-kms-backend
> "The KMS/DRM backend also supports custom configurations via a JSON
> file. Set the environment variable QT_QPA_EGLFS_KMS_CONFIG to the name
> of the file to enable this."

Thanks, this did the trick!

Now I can succesfully lauch the Cinematic demo using Buildroot master.
Thanks to Peter for his two Qt5.8 fixes!

Any suggestions for a proper fix on the 'black screen' problem?

Thanks
